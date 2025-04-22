// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Form validation for the reservation form
    const reservationForm = document.querySelector('#reservation-box form');
    if (reservationForm) {
        reservationForm.addEventListener('submit', function(e) {
            // Validate date (must be today or future)
            const dateInput = document.getElementById('date');
            const selectedDate = new Date(dateInput.value);
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Reset time part for accurate comparison

            if (selectedDate < today) {
                alert('Please select a current or future date.');
                e.preventDefault();
                return false;
            }

            // Validate time (restaurant hours 11:00 AM - 10:00 PM)
            const timeInput = document.getElementById('time');
            const timeValue = timeInput.value;
            const hours = parseInt(timeValue.split(':')[0]);

            if (hours < 11 || hours >= 22) {
                alert('Our restaurant is open from 11:00 AM to 10:00 PM. Please select a time within these hours.');
                e.preventDefault();
                return false;
            }

            // If all validations pass, the form will submit
            return true;
        });
    }

    // Set minimum date to today for the date picker
    const dateInput = document.getElementById('date');
    if (dateInput) {
        const today = new Date().toISOString().split('T')[0];
        dateInput.setAttribute('min', today);
    }

    // Smooth scrolling for navigation links
    document.querySelectorAll('nav a').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId.startsWith('#')) {
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    targetElement.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            } else {
                // For non-hash links (like your JSP pages), allow normal navigation
                window.location.href = targetId;
            }
        });
    });

    // Dynamic greeting based on time of day
    const greetingElement = document.querySelector('#showcase h1');
    if (greetingElement) {
        const hour = new Date().getHours();
        let greeting = 'Fine Dining Experience';

        if (hour < 12) {
            greeting = 'Good Morning, Welcome to Amali';
        } else if (hour < 18) {
            greeting = 'Good Afternoon, Welcome to Amali';
        } else {
            greeting = 'Good Evening, Welcome to Amali';
        }

        greetingElement.textContent = greeting;
    }

    // Feature boxes hover effect
    const featureBoxes = document.querySelectorAll('.feature-box');
    featureBoxes.forEach(box => {
        box.addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.05)';
            this.style.transition = 'transform 0.3s ease';
        });

        box.addEventListener('mouseleave', function() {
            this.style.transform = 'scale(1)';
        });
    });

    // Form input styling on focus
    const formInputs = document.querySelectorAll('input, select');
    formInputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.style.borderColor = '#e8491d';
            this.style.boxShadow = '0 0 5px rgba(232, 73, 29, 0.5)';
        });

        input.addEventListener('blur', function() {
            this.style.borderColor = '#cccccc';
            this.style.boxShadow = 'none';
        });
    });
});