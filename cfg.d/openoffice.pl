
# Bazaar Configuration

$c->{plugins}{"OpenOffice"}{params}{disable} = 0;
$c->{plugins}{"Screen::Admin::OpenOfficeControl"}{params}{disable} = 0;
$c->{plugins}{"Screen::EPMC::OpenOffice"}{params}{disable} = 0;
$c->{plugins}{"Convert::ImageMagick::ThumbnailMSOffice"}{params}{disable} = 0;

# OpenOffice paths

$c->{executables}->{openoffice} = '/usr/lib64/libreoffice/program/soffice.bin';
$c->{executables}->{python} = '/usr/bin/python';
$c->{executables}->{uno_converter} = "/usr/bin/unoconv";

$c->{invocation}->{openoffice} = '$(openoffice) "--accept=socket,host=localhost,port=2002;urp;StarOffice.ServiceManager" --norestore --nofirststartwizard --nologo --headless';

 
