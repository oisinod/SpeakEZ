import { Controller } from "stimulus"
import $ from "jquery";
import "select2";

const selectbox = document.getElementById("selectbox")

  $(selectbox).select2(
    { tags: true,
      theme: 'classic',
      width:'element',
      templateResult: formatFlag
      }
      );

      function formatFlag (state) {
        if (!state.id) {
          return state.text;
        }
        var baseUrl = "/assets/flags";
        const split = state.text.split(" ")

        var $state = $(
          '<span><img src="' + baseUrl + '/' + split[0] + '.svg" class="img-flag"  /> ' + split[1] + '</span>'
        );
        console.log(state)
        return $state;
      };
