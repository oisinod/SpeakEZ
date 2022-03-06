import { Controller } from "stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

export default class extends Controller {

  connect() {
    $(function() {
      $(this.element).barrating({
        theme: 'css-stars',
        showSelectedRating: false
    });
    });
  }
}
