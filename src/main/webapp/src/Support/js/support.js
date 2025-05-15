document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contactForm');

    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();

        // Clear previous errors
        clearErrors();

        // Validate form
        if (validateForm()) {
            // Form is valid, submit it
            this.submit();
        }
    });

    function validateForm() {
        let isValid = true;

        // Check required fields
        const email = document.getElementById('email');
        const message = document.getElementById('message');

        if (!email.value.trim()) {
            showError(email, 'Email is required');
            isValid = false;
        } else if (!isValidEmail(email.value.trim())) {
            showError(email, 'Please enter a valid email address');
            isValid = false;
        }

        if (!message.value.trim()) {
            showError(message, 'Message is required');
            isValid = false;
        }

        return isValid;
    }

    function showError(field, message) {
        const formGroup = field.closest('.form-group');
        let errorElement = formGroup.querySelector('.error');

        if (!errorElement) {
            errorElement = document.createElement('div');
            errorElement.className = 'error';
            formGroup.appendChild(errorElement);
        }

        errorElement.textContent = message;
        field.classList.add('error-field');
    }

    function clearErrors() {
        const errorElements = document.querySelectorAll('.error');
        errorElements.forEach(element => element.remove());

        const errorFields = document.querySelectorAll('.error-field');
        errorFields.forEach(field => field.classList.remove('error-field'));
    }

    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
});