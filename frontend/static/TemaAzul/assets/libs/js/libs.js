var templateContent = document.querySelector('#app template').content;
var divElement = document.createElement('div');
divElement.appendChild(templateContent.cloneNode(true));
var templateElement = document.querySelector('#app template');
templateElement.parentNode.replaceChild(divElement, templateElement);