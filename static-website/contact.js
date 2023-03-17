document.getElementById('contact-form').addEventListener("submit", function(e) {
    // Prevent the default form action as we send an axios POST request
    // to the contact endpoint.
    e.preventDefault();
  
    const data = new FormData(e.target);

    import('axios').then(({ default: axios }) => {
        axios.post('https://r8i1c5x64a.execute-api.eu-west-1.amazonaws.com/default/feedback-course', {
            name: data.get('name'),
            email: data.get('email'),
            desc: data.get('message')
            })
            .then(function (response) {
                // Request was successfully sent.
            })
            .catch(function (error) {
                console.log(error);
        });
    });
});