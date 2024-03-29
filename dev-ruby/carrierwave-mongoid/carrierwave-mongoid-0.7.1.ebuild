# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Mongoid support for CarrierWave"
HOMEPAGE="https://github.com/carrierwaveuploader/carrierwave-mongoid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/carrierwave-0.8.0"
ruby_add_rdepend ">=dev-ruby/mongoid-3.0"
ruby_add_rdepend ">=dev-ruby/mongoid-grid_fs-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/mini_magick-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

