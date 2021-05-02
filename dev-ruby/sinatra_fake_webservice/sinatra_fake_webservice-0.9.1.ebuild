# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="FakeWeb allows you to fake a response from a specific url, this gem intends to give developers the option to allow several responses from the same url based on parameters (ex: WSDL)"
HOMEPAGE="http://github.com/eladmeidar/sinatra_fake_webservice"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thoughtbot-shoulda-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"

