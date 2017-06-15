.. _roles-permissions-xxx-ug:

=====================
Roles and permissions
=====================

.. Define |product name| in conf.py

Provide an introductory paragraph, then describe the roles and permissions that
are available for customers. Use tables as needed to make the connections
between roles and permissions clear. The following sections and tables provide
an example.

Roles
~~~~~

Predefined roles and the rights that they contain are available in all
organizations. All of the roles in the following table are available
for the customer. Rackspace support has the System Administrator role at the
System organization level.

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Role
     - Description
   * - Administrator
     - After creating an organization, Rackspace assigns the role of
       Administrator to the user or group provided by the customer.
   * - Catalog Author
     - The rights associated with the Catalog Author role allow a user to
       create and publish catalogs.
   * - Console Access Only
     - The rights associated with the Console Access Only role allow a user to
       view VM states and properties and to use the guest OS.

Permissions
~~~~~~~~~~~~

The following tables detail the permissions for the roles that can be assigned
for customer use.

.. list-table::
   :widths: 25 25 10 10 10
   :header-rows: 1

   * - Permission
     - Description
     - Administrator
     - Catalog Author
     - Console Access Only
   * - Add vApp from My Cloud
     - Add a vApp to a catalog from My Cloud
     - X
     - X
     -
   * - Change owner
     - Change the owner of a catalog
     - X
     -
     -
   * - Create or delete a catalog
     - Create and delete catalogs
     - X
     - X
     -
   * - Allow external publishing or subscriptions for the catalogs
     - Publish catalogs for external consumption and subscribe to external
       catalog feeds.
     - X
     - X
     -
