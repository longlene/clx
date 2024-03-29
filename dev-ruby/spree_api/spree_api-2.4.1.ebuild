# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Spree's API"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/spree_core-2.4.1"
ruby_add_rdepend ">=dev-ruby/rabl-0.9.4"
ruby_add_rdepend ">=dev-ruby/versioncake-2.3.1"

