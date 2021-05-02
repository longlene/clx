# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  ShowOff is a Sinatra web app that reads simple configuration files for a
  presentation"
HOMEPAGE="http://github.com/schacon/showoff"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.3"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/gli-1.3.2"
ruby_add_rdepend ">=dev-ruby/parslet-0"
ruby_add_rdepend ">=dev-ruby/htmlentities-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/sinatra-websocket-0"
ruby_add_rdepend ">=www-servers/thin-1.3"
ruby_add_rdepend ">=dev-ruby/mg-0"

