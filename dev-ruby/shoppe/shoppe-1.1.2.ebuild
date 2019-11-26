# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A full Rails engine providing e-commerce functionality for any Rails 4 application"
HOMEPAGE="http://tryshoppe.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/bcrypt-3.1.2"
ruby_add_rdepend ">=dev-ruby/ransack-1.2.0"
ruby_add_rdepend ">=dev-ruby/kaminari-0.14.1"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/dynamic_form-1.1"
ruby_add_rdepend "<dev-ruby/jquery-rails-3"
ruby_add_rdepend "<dev-ruby/roo-1.13.0"
ruby_add_rdepend ">=dev-ruby/awesome_nested_set-3.0.2"
ruby_add_rdepend ">=dev-ruby/globalize-0"
ruby_add_rdepend ">=dev-ruby/nifty-key-value-store-1.0.1"
ruby_add_rdepend ">=dev-ruby/nifty-utils-1.0"
ruby_add_rdepend ">=dev-ruby/nifty-dialog-1.0.7"
ruby_add_rdepend ">=dev-ruby/carrierwave-0.10.0"
ruby_add_rdepend ">=dev-ruby/fog-1.36.0"
ruby_add_rdepend ">=dev-ruby/net-ssh-3.0.1"
ruby_add_rdepend ">=dev-ruby/mini_magick-4.2.7"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4"
ruby_add_rdepend ">=dev-ruby/sass-rails-4.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/yard-activerecord-0"
ruby_add_rdepend ">=dev-ruby/markdown-1.0"
ruby_add_rdepend ">=dev-ruby/factory_girl_rails-4.5"

