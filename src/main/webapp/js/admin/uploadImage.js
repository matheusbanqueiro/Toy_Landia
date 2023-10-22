/**
 * 
 */

 const dropzone = document.getElementById("dropzone");
        const fileInput = document.getElementById("image");
        const fileNameDisplay = document.getElementById("file-name");

        dropzone.addEventListener("dragover", (e) => {
            e.preventDefault();
            dropzone.style.backgroundColor = "#e0e0e0";
        });

        dropzone.addEventListener("dragleave", () => {
            dropzone.style.backgroundColor = "white";
        });

        dropzone.addEventListener("drop", (e) => {
            e.preventDefault();
            dropzone.style.backgroundColor = "white";

            const file = e.dataTransfer.files[0];
            if (file) {
                fileInput.files = e.dataTransfer.files;
                displayFileName(file);
            }
        });

        dropzone.addEventListener("click", () => {
            fileInput.click();
        });

        fileInput.addEventListener("change", () => {
            const file = fileInput.files[0];
            displayFileName(file);
        });

        function displayFileName(file) {
            if (file) {
                fileNameDisplay.textContent = "Arquivo selecionado: " + file.name;
            } else {
                fileNameDisplay.textContent = "";
            }
        }