dpkginv
=======

Query installed packages on Debian/Ubuntu-based systems and emit
inventory as JSON

Usage:

    $ gem install dpkginv
    $ dpkginv


If you want to include a per-host unique identifier to avoid relying
on FQDN, create a file `/etc/dpkginv.conf` containing:

    system_id: <some_id_for_this_host>

You could, for example, set this to the value of
`/sys/class/dmi/id/product_uuid`
