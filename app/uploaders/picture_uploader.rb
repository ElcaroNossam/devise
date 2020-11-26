class PictureUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
     storage :fog

    process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

end
    # Указывает каталог для хранения загруженных файлов.
    # Разумно оставить значение по умолчанию загрузчикам для монтирования.
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    # Добавляет белый список расширений, которые позволено загружать.
    def extension_white_list
      %w(jpg jpeg gif png)
    end
  end