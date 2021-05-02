# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="      Spidergazelle, spidergazelle, amazingly agile, she leaps through the veldt,
      Spidergazelle, spidergazelle! She don’t care what you think, she says what the hell!
      Look out! Here comes the Spidergazelle!
"
HOMEPAGE="https://github.com/cotag/spider-gazelle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/http-parser-0"
ruby_add_rdepend ">=dev-ruby/libuv-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/websocket-driver-0"
ruby_add_rdepend ">=dev-ruby/thread_safe-0"
ruby_add_rdepend ">=dev-ruby/radix-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/yard-0"

