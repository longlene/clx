# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Minitest test runner for Opal"
HOMEPAGE="https://github.com/aost/opal-minitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opal-0.8"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend "=dev-ruby/minitest-5.3.4"

