# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple, Git-powered wiki with a sweet API and local frontend"
HOMEPAGE="http://github.com/gollum/gollum-lib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/github-markup-1.1.0"
ruby_add_rdepend ">=dev-ruby/gitlab-grit-2.6.5"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.1"
ruby_add_rdepend ">=dev-ruby/rouge-1.3.3"
ruby_add_rdepend ">=dev-ruby/sanitize-2.1.0"
ruby_add_rdepend ">=dev-ruby/stringex-2.5.1"

