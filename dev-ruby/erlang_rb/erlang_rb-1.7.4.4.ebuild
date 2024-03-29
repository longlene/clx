# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Erlang Binary Term Format for Ruby"
HOMEPAGE="https://github.com/okeuday/erlang_rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


