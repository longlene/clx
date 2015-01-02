# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A sinatra based gem hosting app, with client side gem push style functionality"
HOMEPAGE="http://tomlea.co.uk/p/gem-in-a-box"

LICENSE="MIT-LICENSE"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.2.7"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend ">=dev-ruby/httpclient-2.2.7"
ruby_add_rdepend ">=dev-ruby/nesty-0"
ruby_add_rdepend ">=dev-ruby/faraday-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

