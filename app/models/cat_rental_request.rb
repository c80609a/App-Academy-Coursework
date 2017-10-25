class CatRentalRequest < ApplicationRecord
  STATUSES = ['PENDING', 'APPROVED', 'DENIED']
  validates :status, inclusion: { in: STATUSES}
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
  class_name: :Cat,
  foreign_key: :cat_id,
  primary_key: :id

  def overlapping_requests
    CatRentalRequest
    .where.not(id: self.id)
    .where(cat_id: cat_id)
    .where.not('start_date > :end_date OR end_date < :start_date',
               start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    return if self.status == 'DENIED'

    if !overlapping_approved_requests.empty?
      errors[:base] << 'Conflict with approved request'
    end
  end

  def overlapping_pending_requests
      overlapping_requests.where(status: 'PENDING')
  end

  def does_not_overlap_pending_request
    unless overlapping_pending_requests.empty?
      errors[:base] << 'Conflicts with pending requests'
    end
  end

  def approve!
    pending_requests = CatRentalRequest.where(status: 'PENDING')
    pending_requests.each do |request|
      if request.does_not_overlap_approved_request && request.does_not_overlap_pending_request
        #change status to APPROVED
        request.update(status: 'APPROVED')
      else
        #change status to DENIED
        request.update(status: 'DENIED')
      end
    end

  end
  
end
