# Run via: ruby app.rb
require 'sinatra'
require 'slim'

disable :logging

get '/' do
  title = "Drag'n'drop issue reduction"
  slim :index
end

__END__

@@ index
html
  head
    script src="/jquery2.js"
    script src="/jquery-ui.js"

    javascript:
      $(function(){
        $('.documents').sortable({connectWith: '.photos'});
        $('.photos').sortable({connectWith: '.documents'});
      })

    css:
      body { margin: 0; padding: 0; background: #fff; }
      #lists { width: 100px; }
      ul {
        list-style: none;
        padding: 0;
        margin: 0 0 20px 0;
        border: 1px solid gray;
      }
      
      li {
        height: 20px;
        line-height: 20px;
      }
      li.ui-sortable-helper {
        background: orange;
        opacity: 0.5;
      }
      li.ui-sortable-placeholder {
        background: green;
        visibility: visible !important;
      }

  body
    #lists
      ul.documents
        li.first Document #1
        li.second Document #2
        li.third Document #3
        li.fourth Document #4

      ul.photos
        li.first Photo #1
        li.second Photo #2
        li.third Photo #3
        li.fourth Photo #4

