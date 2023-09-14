# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pinyin is a romanization system (phonemic notation) of Chinese characters, this gem helps you to convert Chinese characters into pinyin form"
HOMEPAGE="https://github.com/janx/ruby-pinyin"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rmmseg-cpp-new-0.3.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.4"

