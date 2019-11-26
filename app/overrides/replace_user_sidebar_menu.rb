Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'replace_user_sidebar_menu',
  replace: 'nav ul.nav:nth-child(5)',
  partial: 'spree/admin/shared/user_and_contact_tools'
)