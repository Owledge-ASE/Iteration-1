(function(){

    var TagsInput = function(opts){
        this.options = Object.assign(TagsInput.defaults , opts);
        this.original_input = document.getElementById(opts.selector);
        this.arr = [];
        this.wrapper = document.createElement('div');
        this.input = document.createElement('input');
        this.input.setAttribute("id", "input-tag-"+this.options.selector);
        this.wrapper.setAttribute("id", "tags-input-wrapper-"+this.options.selector);
        buildUI(this);
        addEvents(this);
    }


    TagsInput.prototype.addTag = function(string){

        if(this.anyErrors(string))
            return ;

        this.arr.push(string);
        var tagInput = this;


        var tag = document.createElement('span');
        tag.className = this.options.tagClass;
        tag.innerText = string;

        var closeIcon = document.createElement('a');
        closeIcon.innerHTML = '&times;';
        closeIcon.addEventListener('click' , function(e){
            e.preventDefault();
            var tag = this.parentNode;

            for(var i =0 ;i < tagInput.wrapper.childNodes.length ; i++){
                if(tagInput.wrapper.childNodes[i] == tag)
                    tagInput.deleteTag(tag , i);
            }
        })


        tag.appendChild(closeIcon);
        this.wrapper.insertBefore(tag , this.input);
        this.original_input.value = this.arr.join(',');

        return this;
    }



    TagsInput.prototype.deleteTag = function(tag , i){
        tag.remove();
        this.arr.splice( i , 1);
        this.original_input.value =  this.arr.join(',');
        return this;
    }


    TagsInput.prototype.anyErrors = function (string) {
        function errorPopup(message) {
            console.error(message);
            const error = document.createTextNode(message);
            const dismiss = document.createElement('button');
            dismiss.classList.add('close', 'float-end', 'btn', 'btn-lg', 'btn-icon', 'p-0');
            dismiss.dataset.dismiss = 'alert';
            dismiss.setAttribute('aria-label', 'Close');
            dismiss.innerHTML = '<i class="far fa-window-close" style="color: black;"></i>';
            const alert = document.createElement('div');
            alert.classList.add("alert", "alert-warning", "alert-dismissible", "fade", "show");
            alert.setAttribute('role', 'alert');
            alert.id = 'flash-alert';
            alert.appendChild(error);
            alert.appendChild(dismiss);
            const flashAlert = document.getElementById('flash-alert');
            if (flashAlert) {
                flashAlert.remove();
            }
            document.getElementById('app-header-section').appendChild(alert);
            dismiss.onclick = () => {
                $(alert).fadeOut();
            }
            setTimeout(() => {
                $(alert).fadeOut();
            }, 5000);
        }

        if (this.options.max != null && this.arr.length >= this.options.max) {
            errorPopup('Max tags limit reached.');

            return true;
        }
    
        if (!this.options.duplicate && this.arr.indexOf(string) != -1) {
            errorPopup('Duplicate found " ' + string + ' " ');
            return true;
        }
    
        if (this.options.validator !== undefined && !this.options.validator(string)) {
            console.error('Invalid input: ' + string)
            return true;
        }
    
        return false;
    }


    TagsInput.prototype.addData = function(array){
        var plugin = this;
        
        array.forEach(function(string){
            plugin.addTag(string);
        })
        return this;
    }

    
    TagsInput.prototype.getInputString = function(){
        return this.arr.join(',');
    }


    // Private function to initialize the UI Elements
    function buildUI(tags){
        tags.wrapper.append(tags.input);
        tags.wrapper.classList.add(tags.options.wrapperClass);
        tags.original_input.setAttribute('hidden' , 'true');
        tags.original_input.parentNode.insertBefore(tags.wrapper , tags.original_input);
    }



    function addEvents(tags){
        tags.wrapper.addEventListener('click' ,function(){
            tags.input.focus();           
        });
        tags.input.addEventListener('keydown' , function(e){
            const key = e.key;
            const str = tags.input.value.trim().replace(',', '')
            if( !!(~['Tab' , 'Enter' , ',', ' '].indexOf( e.key ))  ) {
                tags.input.value = "";
                if(str !== "")
                    tags.addTag(str);
                e.preventDefault();
            }
        });
    }


    TagsInput.defaults = {
        selector : '',
        wrapperClass : 'tags-input-wrapper',
        tagClass : 'tag',
        max : null,
        duplicate: false
    }


    window.TagsInput = TagsInput;

})();



var tagInput1 = new TagsInput({
    selector: "tag-input1",
    duplicate : false,
    max : 10
});
let tags_list = document.querySelector("#fake_input").value
if(tags_list){
    tags_list = tags_list.split(",")
    tags_list.pop()
    tagInput1.addData(tags_list)
}