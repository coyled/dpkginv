dpkginv
=======

Query installed packages on Debian/Ubuntu-based systems and emit
inventory as JSON

Usage
-----

    $ gem install dpkginv
    $ dpkginv


If you want to include a per-host unique identifier to avoid relying
on FQDN, create a file `/etc/dpkginv.conf` containing:

    system_id: <some_id_for_this_host>

You could, for example, set this to the value of
`/sys/class/dmi/id/product_uuid` or
`/sys/hypervisor/uuid`

Example
-------

    $ dpkginv
    {
      "fqdn": "foo.example.com",
      "lsb": {
        "id": "Ubuntu",
        "release": "12.04",
        "codename": "precise",
        "description": "Ubuntu 12.04.1 LTS"
      },
      "kernel": {
        "release": "3.0.18-linode43",
        "machine": "i686"
      },
      "dpkg": {
        "accountsservice": {
          "selection_status": "install",
          "install_status": "installed",
          "version": "0.6.15-2ubuntu9.4",
          "arch": "i386"
        },
        "adduser": {
          "selection_status": "install",
          "install_status": "installed",
          "version": "3.113ubuntu2",
          "arch": "all"
        },
        <...>
      },
      "created_at": "2012-11-21T12:04:24-00:00",
      "system_id": "0d5d6fb2-4f08-4523-815d-d95bd0de2dc6"
    }
    $
