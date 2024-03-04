# OpenOffice Toolkit
This is an ingredient intended for use with EPrints 3.4+. It is designed to allow EPrints to connect to OpenOffice (or LibreOffice0 to support the generation of coverhseets for PDF documents and to allow Thumbnails to be generated from MicroSoft Office documents.  It allows a headless version of OpenOffice/LibreOffice to be controlled either via Systemd module to manage it from the command line of from controls within EPrints admin web interface.

This ingredient is based on the [original Coversheets Bazaar plugin](https://bazaar.eprints.org/164/).  There are various improvements, in particular the ability to start and manage OpenOffice/LibreOffice from operating system, which ensure greater reliability than through EPrints admin web interface.


## Installation

1. Install a headless version of OpenOffice of LibreOffice using the operating system's package manager.  E.g.

```yum install libreoffice-base libreoffice-writer```

```apt install libreoffice-base librooffice-writter```

2. Install `unoconv` Python library.  If you have are running a modern version of Linux this should be able via the package manager. E.g.

```yum install unoconv```

```apt install unoconv```

If it is not then install as the root user using Python's `pip` installer. (You may need to use `pip3` rather than `pip`).

```pip install unoconv```

3. Checkout this ingredient to EPrints' `ingredients/` directory.

4. Add this ingredient to the inc file of the flavour used by your EPrints archive.  E.g. `EPRINTS\_PATH/flavours/pub\_lib/inc`

5. If you want to maintain OpenOffice/LibreOffice using Systemd.

	a. As root, copy `bin/epoffice.service` to `/lib/systemd/system/` and start and enable it.
	```
	cp bin/epooffice.service /lib/systemd/system/
	systemctl enable --now epooffice
	```

	b. Copy cfg.d/z_disable_openoffice_buttons.pl.disabled to your archive's `cfg/cfg.d/` directory to remove the controls from the admin web interface or you are liable to end up duplicate versions of OpenOffice/LibreOffice, which could mean coversheeting does not work as expected. :
	
	```cp cfg.d/z_disable_openoffice_buttons.pl.disabled ../../archives/ARCHIVE\_ID/cfg/cfg.d/z_disable_openoffice_buttons.pl

6. Run `epadmin test` to confirm there are no problems with EPrints' overall configuration.s

7. Reload the webserver. E.g. `apachectl graceful`


## Usage

***TO BE WRITTEN***


## Further Information

See https://wiki.eprints.org/w/Openoffice\_Ingredient
