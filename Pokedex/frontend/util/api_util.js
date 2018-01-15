

export const fetchAllPokemon = () => (
  $.ajax ({
    method: 'GET',
    url: '/api/pokemon'
  })
);

export const getSinglePokemon = (id) =>  (
  $.ajax ({
    method: 'GET',
    url: `/api/pokemon/${id}`
  })
);
