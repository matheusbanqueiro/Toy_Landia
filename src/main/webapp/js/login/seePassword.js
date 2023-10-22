/**
 * 
 */

    const passwordField = document.getElementById("password");
        const togglePasswordButton = document.getElementById("togglePassword");
        let passwordVisible = false;
        togglePasswordButton.addEventListener("click", function () {
            passwordVisible = !passwordVisible;
            if (passwordVisible) {
                passwordField.type = "text";
                togglePasswordButton.innerHTML = `
                	 <svg width="20" height="14" viewBox="0 0 20 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="absolute w-4 h-4 right-6 top-1/2 transform -translate-y-1/2 cursor-pointer">
					  <path d="M10 9C11.1046 9 12 8.10457 12 7C12 5.89543 11.1046 5 10 5C8.89544 5 8.00001 5.89543 8.00001 7C8.00001 8.10457 8.89544 9 10 9Z" fill="#F4F4F4"/>
					  <path fill-rule="evenodd" clip-rule="evenodd" d="M0.457764 7.00004C1.73202 2.94291 5.52232 0 9.99997 0C14.4776 0 18.2679 2.94288 19.5422 6.99996C18.2679 11.0571 14.4776 14 9.99995 14C5.52232 14 1.73204 11.0571 0.457764 7.00004ZM14 7C14 9.20914 12.2091 11 10 11C7.79087 11 6.00001 9.20914 6.00001 7C6.00001 4.79086 7.79087 3 10 3C12.2091 3 14 4.79086 14 7Z" fill="#F4F4F4"/>
					</svg>
                `;
            } else {
                passwordField.type = "password";
                togglePasswordButton.innerHTML = `
                	 <svg width="20" height="17" viewBox="0 0 20 17" fill="none" xmlns="http://www.w3.org/2000/svg" class="absolute w-4 h-4 right-6 top-1/2 transform -translate-y-1/2 cursor-pointer">
					  <path fill-rule="evenodd" clip-rule="evenodd" d="M3.2491 0.792893C2.85857 0.402369 2.22541 0.402369 1.83489 0.792893C1.44436 1.18342 1.44436 1.81658 1.83489 2.20711L15.8349 16.2071C16.2254 16.5976 16.8586 16.5976 17.2491 16.2071C17.6396 15.8166 17.6396 15.1834 17.2491 14.7929L15.7759 13.3197C17.3135 12.0924 18.481 10.4211 19.0844 8.49996C17.8101 4.44288 14.0198 1.5 9.54221 1.5C7.91864 1.5 6.38544 1.88692 5.02978 2.57358L3.2491 0.792893ZM7.51012 5.05391L9.024 6.5678C9.18929 6.52358 9.36301 6.5 9.54225 6.5C10.6468 6.5 11.5422 7.39543 11.5422 8.5C11.5422 8.67923 11.5187 8.85296 11.4744 9.01824L12.9883 10.5321C13.3403 9.93658 13.5422 9.24187 13.5422 8.5C13.5422 6.29086 11.7514 4.5 9.54225 4.5C8.80037 4.5 8.10567 4.70197 7.51012 5.05391Z" fill="#F4F4F4"/>
					  <path d="M11.9961 15.1967L9.29165 12.4923C7.28212 12.3681 5.67419 10.7601 5.54997 8.7506L1.87691 5.07754C1.04262 6.07223 0.398361 7.23169 0 8.50004C1.27428 12.5571 5.06456 15.5 9.54219 15.5C10.3888 15.5 11.2109 15.3948 11.9961 15.1967Z" fill="#F4F4F4"/>
					</svg>
                `;
            }
        });
        function validarFormulario() {
            const loginField = document.getElementsByName("login")[0];
            const senhaField = document.getElementsByName("senha")[0];

            if (loginField.value.trim() === "" || senhaField.value.trim() === "") {
                alert("Por favor, preencha todos os campos.");
                return false; 
            }

            return true; 
        }