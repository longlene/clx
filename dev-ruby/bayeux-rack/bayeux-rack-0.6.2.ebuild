# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
Bayeux (COMET or long-polling) protocol server as a Sinatra application"
HOMEPAGE="http://github.com/cjheath/bayeux-rack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.4.6"
ruby_add_rdepend ">dev-ruby/async_sinatra-0.1"
ruby_add_rdepend ">=dev-ruby/eventmachine-0.12"
ruby_add_rdepend ">=dev-ruby/thin-1.2"

