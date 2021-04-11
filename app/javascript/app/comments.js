
function sanitizeHtml(element) {
    return element.innerHTML || "";
}
document.querySelectorAll('.markdown').forEach(element => {
    element.innerHTML = this.md.render(sanitizeHtml(element));
});
