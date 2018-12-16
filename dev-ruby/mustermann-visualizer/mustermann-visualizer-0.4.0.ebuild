# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides syntax highlighting and other visualizations for Mustermman"
HOMEPAGE="https://github.com/rkh/mustermann"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/mustermann-0.4.0"
ruby_add_rdepend ">=dev-ruby/hansi-0.1.1"

