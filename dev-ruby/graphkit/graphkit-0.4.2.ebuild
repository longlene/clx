# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A GraphKit is a device independent intelligent data container that allows the easy sharing, combining and plotting of graphic data representations"
HOMEPAGE="http://github.com/edmundhighcock/graphkit"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyhacks-0.1.0"
ruby_add_rdepend ">=dev-ruby/shoulda-0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"
ruby_add_rdepend ">dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-2.0"

