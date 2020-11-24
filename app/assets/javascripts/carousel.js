const container = document.getElementById("container");
const children = container.children;

console.log(children);

container.appendChild(container.firstElementChild.cloneNode()).innerHTML = container.firstElementChild.innerHTML

async function roll(){
    for(let i = 0; i < children.length; i++){
        Array.from(children).forEach(el => {
            el.style.transform = `translateY(${container.offsetHeight * i}px)`
            console.log(`${container.offsetHeight * i}px`);
        });
        await sleep(500)
    }
}


function sleep(ms){
    return new Promise(r => setTimeout(r, ms));
}
  