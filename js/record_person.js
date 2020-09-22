document.addEventListener('DOMContentLoaded', function(){
    document.querySelectorAll('.form__input').forEach(function(input){
        input.addEventListener('input', function(){
            this.className = this.className.replace(/form__input--error ?/, '') // form__input--error class is removed (replaced with nothing) with Regex. " ?" means, that the whitespace at the end is optional.
        });

        function success() {
            if (document.getElementById('ahvNr').value === "") {
                document.getElementsByClassName('form__btn').disabled = true;
            } else {
                document.getElementsByClassName('form__btn').disabled = false
            }
            
        }

        if(input.id === 'ahvNr'){
            input.addEventListener('change', function(){

                var regexAHV = /\d{3}.\d{4}.\d{4}.\d{2}/;
                let isValid = regexAHV.test(this.value);                
                console.log(isValid);
                
                if(!isValid){
                    input.classList.add('form__input--error');
                }
            })
        }

        if(input.id === 'email'){
            input.addEventListener('change', function(){

                var regex = /\S+@\S+\.\S+/;
                let isValid = regex.test(this.value);                
                console.log(isValid);
                
                if(!isValid){
                    input.classList.add('form__input--error');
                }
            })
        }
    });
});