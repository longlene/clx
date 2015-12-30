# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Local previews for Github markdown"
HOMEPAGE="https://github.com/dmarcotte/github-markdown-preview"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/listen-2.8"
ruby_add_rdepend ">=dev-ruby/html-pipeline-1.11"
ruby_add_rdepend ">=dev-ruby/sanitize-3.0"
ruby_add_rdepend ">=dev-ruby/github-markdown-0.6"
ruby_add_rdepend ">=dev-ruby/gemoji-2.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.3"

