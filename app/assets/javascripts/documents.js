$.widget("shift.selectable", $.ui.selectable, {
  options: {}, // required
  previousIndex: -1, // additional attribute to store previous selection index
  currentIndex: -1, // additional attribute to store current selection index
  _create: function() { // required
    var self = this;

    $.ui.selectable.prototype._create.call(this); // default implementation

    // here is our addition, we are catching "selecting" event with shift key
    $(this.element).on('selectableselecting', function(event, ui){
      self.currentIndex = $(ui.selecting.tagName, event.target).index(ui.selecting);
      if(event.shiftKey && self.previousIndex > -1) {
        $(ui.selecting.tagName, event.target).slice(Math.min(self.previousIndex, self.currentIndex), 1 + Math.max(self.previousIndex, self.currentIndex)).addClass('ui-selected');
        self.previousIndex = -1;
      } else {
        self.previousIndex = self.currentIndex;
      }
    });
  },
  destroy: function() { // required, default implementation
    $.ui.selectable.prototype.destroy.call(this);
  },
  _setOption: function() { // required, default implementation
    $.ui.selectable.prototype._setOption.apply(this, arguments);
  }
});


$('#selectable').selectable();
