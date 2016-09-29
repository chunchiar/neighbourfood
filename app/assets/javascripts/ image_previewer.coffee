imagePreviewFunctions = () ->
    $('.image-uploader').on 'change', (event) ->

      files = event.target.files
      image = files[0]
      reader = new FileReader()

      reader.readAsDataURL(image)

      reader.onload = (file) ->
        img = new Image()
        img.src = file.target.result
        img.classList = "profile-img img-responsive"
        $('#preview-image').html(img)

  $(document).on 'turbolinks:load', imagePreviewFunctions
