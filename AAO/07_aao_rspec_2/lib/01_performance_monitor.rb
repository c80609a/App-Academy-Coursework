
def measure(times = 1, &prc)
  start = Time.now
   times.times { prc.call }
  (Time.now - start) / times
end
