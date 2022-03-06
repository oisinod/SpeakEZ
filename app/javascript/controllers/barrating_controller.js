import { Controller } from "stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

export default class extends Controller {

  connect() {
    $(function() {
      $('#user_language_skill_level').barrating({
        theme: 'bars-movie',
    });
    });
  }
}
