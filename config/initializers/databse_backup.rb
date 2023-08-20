require 'postgresql_backup'

PostgresqlBackup.configure do |config|
  # This gem works with two possible repositories:
  #
  # * S3: use S3 instead of the file system by setting `S3` to the
  #   repository. Make sure you also set `aws_access_key_id` and
  #   `aws_secret_access_key` or an error will be raised when you try
  #   to execute the rake tasks. The `bucket` and `region` attributes
  #   can also be defined, but they have default values and can also
  #   be overriden (or set by the first time) when the rake is
  #   called.
  #
  # * File System: this is the default value. Files will be stored
  #   in the disk, into the folder defined in the `backup_folder`.
  # config.repository = 'S3'

  # The folder where files will be stored in the file system.
  # The default is `db/backups` and it will be ignored if you set
  # `repository` to 'S3'.
  config.backup_folder = 'db/backups'

  # Get your access key and secret key from AWS console:
  # IAM -> Users -> Security Credentials tab -> access keys
  # config.aws_access_key_id = ''
  # config.aws_secret_access_key = ''

  # The name of the bucket where the backup files will be stored
  # (and from where they will be retrieved). The default value
  # is `postgresql-backups`, but this will be ignored unless the
  # repository is set to S3.
  # config.bucket = ''

  # This is the region where your storage is. The default value
  # is `us-east-1`. It will also be ignored unless the repository
  # is set to S3.
  # config.region = ''

  # Backup files are created using a pattern made by the current date
  # and time. If you want to add a sufix to the files, change this
  # attribute.
  # config.file_suffix = ''

  # If you use S3 to upload the backup files, you need to provide a
  # path where they are going to be stored. The remote path is the
  # place to do that. The default value is `_backups/database/`
  # config.remote_path = ''

  # There are cases where we need to run a command before or after the database
  # is restored or a backup is created. To accomplish this, you can set the
  # `hooks` attribute to a class or an instance of a class that
  # responds to the method you need.
  #
  #  Available hook methods are:
  #
  #  * before_restore
  #  * after_restore
  #  * before_dump
  #  * after_dump
  #
  config.hooks = nil
end