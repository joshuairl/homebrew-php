require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Timezonedb < AbstractPhp54Extension
  init
  homepage 'http://pecl.php.net/package/timezonedb'
  url 'http://pecl.php.net/get/timezonedb-2013.7.tgz'
  sha1 '01c41e0cf9e7c62474029878ea0e580c8aecc29f'
  head 'https://svn.php.net/repository/pecl/timezonedb/trunk/'

  def install
    Dir.chdir "timezonedb-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/timezonedb.so"
    write_config_file unless build.include? "without-config-file"
  end

end
