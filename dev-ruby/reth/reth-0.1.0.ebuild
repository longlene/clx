# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ethereum full node written in ruby"
HOMEPAGE="https://github.com/janx/reth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/ruby-ethereum-0.9.3"
ruby_add_rdepend ">=dev-ruby/devp2p-0.3"
ruby_add_rdepend ">=dev-ruby/slop-4.3"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/sinatra-contrib-1.4"
ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend "=dev-ruby/minitest-5.8.3"
ruby_add_rdepend "=dev-ruby/yard-0.8.7.6"
ruby_add_rdepend ">=dev-ruby/serpent-0.3"

