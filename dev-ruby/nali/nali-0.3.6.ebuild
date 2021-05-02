# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Async web framework"
HOMEPAGE="https://github.com/4urbanoff/nali"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thin-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/sinatra-websocket-0.3"
ruby_add_rdepend ">=dev-ruby/sinatra-activerecord-2.0"
ruby_add_rdepend ">=dev-ruby/sinatra-reloader-1.0"
ruby_add_rdepend ">dev-ruby/sprockets-2.0"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-1.2"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-1.1"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.3"
ruby_add_rdepend ">=dev-ruby/sass-3.4"

