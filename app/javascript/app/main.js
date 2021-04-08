import "channels"
import MarkdownIt from 'markdown-it'

class Comment extends HTMLElement {
    // A getter/setter for an open property.
    get author() {
        return this.hasAttribute('author');
    }

    set author(val) {
        // Reflect the value of the open property as an HTML attribute.
        if (val) {
            this.setAttribute('author', '');
        } else {
            this.removeAttribute('author');
        }
        this.toggleDrawer();
    }
}
customElements.define('user-comment', Comment);
class Dom {
    constructor(md = new MarkdownIt()) {
        this.md = md;
    }

    run() {
        this.markdown();
        this.comments();
    }
    static run() {
        new Dom().run();
    }

    markdown() {
        function sanitizeHtml(element) {
            return element.innerHTML || "";
        }
        console.log(document.querySelectorAll('span'));
        document.querySelectorAll('.markdown').forEach(element => {
            element.innerHTML = this.md.render(sanitizeHtml(element));
        });
    }

    comments() {
    }
}

export { Dom };