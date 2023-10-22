/**
 * 
 */

 
const categoriasLink = document.getElementById("categoriasLink");
const categoriasIcon = document.getElementById("categoriasIcon");
const dropdownContent = document.getElementById("dropdownContent");

categoriasLink.addEventListener("click", toggleDropdown);
categoriasIcon.addEventListener("click", toggleDropdown);

function toggleDropdown() {
    if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
    } else {
        dropdownContent.style.display = "block";
    }
}