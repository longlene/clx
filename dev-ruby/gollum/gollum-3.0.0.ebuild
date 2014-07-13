# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple, Git-powered wiki with a sweet API and local frontend"
HOMEPAGE="http://github.com/gollum/gollum"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/github-markdown-0.6.5"
ruby_add_rdepend ">=dev-ruby/gollum-lib-3.0"
ruby_add_rdepend ">=dev-ruby/mustache-0.99.5"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4.4"
ruby_add_rdepend ">=dev-ruby/useragent-0.10.0"

