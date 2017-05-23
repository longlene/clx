# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Reactive programming framework for Ruby, painless evented IO, futures and an efficient byte buffer"
HOMEPAGE="http://github.com/iconara/ione"

LICENSE="Apache License 2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


