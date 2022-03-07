import { Controller } from "stimulus"
import $ from "jquery";
import "select2";

const selectbox = document.getElementById("selectbox")
const searchbox = document.querySelector(".select2-search__field")


  $(selectbox).select2(
    { tags: false,
      // theme: 'classic',
      placeholder: 'Choose a language...',
      width:'element',
      // allowClear: true,
      templateResult: formatFlag,
      templateSelection: formatFlag
      }
      );

      function formatFlag (state) {
        if (state.id === '') {
          return 'Choose a language...';
        }

        var baseUrl = "/assets/flags";
        const split = state.text.split(" ")
        var $state = $(
          '<span><img src="' + baseUrl + '/' + split[0] + '.svg" class="img-flag"  /> ' + split[1] + '</span>'
        );
        return $state;
      };
