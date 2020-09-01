document.addEventListener('DOMContentLoaded', function(){
    document.querySelectorAll('.form__input').forEach(function(input){
        input.addEventListener('input', function(){
            this.className = this.className.replace(/form__input--error ?/, '') // form__input--error class is removed (replaced with nothing) with Regex. " ?" means, that the whitespace at the end is optional.
        });

    });
});