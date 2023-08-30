/**
 * 
 */
//모달-셀렉트박스 인원선택 
const peopleCount = document.getElementById("peopleCount");
    

confirmBtn.addEventListener("click", () => {
        const selectedCount = peopleCount.value;
        alert(`선택된 인원 수: ${selectedCount}`);
        modal.style.display = "none";
    });