class AvatarInput < SimpleForm::Inputs::FileInput
def input
out = '' # the output string we're going to build
if object.send("#{attribute_name}?")
  # =image_tag @user.avatar.url(:thumb), :class => 'thumbnail', id: 'avatar'
  out << template.image_tag(object.send(attribute_name).url(:thumb), :class => 'thumbnail', id: 'avatar')
  end
    (out << @builder.file_field(attribute_name, input_html_options)).html_safe
  end
end
