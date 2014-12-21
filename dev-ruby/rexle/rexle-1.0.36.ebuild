# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/jrobertson/rexle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rexleparser-0.4"
ruby_add_rdepend ">=dev-ruby/dynarex-parser-0.2"
ruby_add_rdepend ">=dev-ruby/polyrex-parser-0.3"
ruby_add_rdepend ">=dev-ruby/rexle-builder-0.1"
ruby_add_rdepend ">=dev-ruby/rexle-css-0.1"

