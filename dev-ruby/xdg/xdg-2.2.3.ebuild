# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="XDG provides a module for supporting the XDG Base Directory Standard"
HOMEPAGE="http://rubyworks.github.com/xdg"

LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/detroit-0"
ruby_add_rdepend ">=dev-ruby/qed-0"
ruby_add_rdepend ">=dev-ruby/ae-0"

