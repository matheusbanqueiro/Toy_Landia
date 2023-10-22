/**
 * 
 */

  function showDescription() {
        document.getElementById("readMore").style.display = "inline";
        document.querySelectorAll(".description a")[0].style.display = "none";
        document.querySelectorAll(".description a")[1].style.display = "inline";
    }

    function hideDescription() {
        document.getElementById("readMore").style.display = "none";
        document.querySelectorAll(".description a")[0].style.display = "inline";
        document.querySelectorAll(".description a")[1].style.display = "none";
    }
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