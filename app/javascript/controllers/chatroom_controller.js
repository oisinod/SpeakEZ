import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = [ "form", "messages" ]

  connect() {
    console.log('connecting to the chatroom')

    this.channel = consumer.subscriptions.create(
      // What to connect to
      { channel: 'ChatroomChannel', id: this.chatroomIdValue },
      // what to do with the data broadcasted
      { received: this.#handleReceivedMessage }
    )
  }

  disconnect() {
    console.log(`disconnecting from the chat with id = ${this.chatroomIdValue}`)
    this.channel.unsubscribe();
  }

  #handleReceivedMessage = (messageHTML) => {
    console.log(messageHTML)
    this.messagesTarget.insertAdjacentHTML('beforeend', messageHTML)
    this.formTarget.reset()
    var log = $('#messages');
    $(function() {this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    });
    log.animate({ scrollTop: log.prop('scrollHeight')}, 0);
    // setTimeout(() => this.messagesTarget.scrollTo(-1000, this.messagesTarget.scrollHeight), 1000)
  }


}
